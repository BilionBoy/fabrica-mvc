# syntax=docker/dockerfile:1

# Base image com Ruby 3.3.5 full (com shell e libs básicas)
FROM ruby:3.3.5-slim

# Instala dependências do sistema
RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      curl \
      nodejs npm \
      postgresql-client libpq-dev \
      ffmpeg libvips42 \
      xfonts-75dpi xfonts-base \
      wkhtmltopdf xvfb \
      git && \
    npm install -g yarn && \
    ln -s /usr/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Copia Gemfile e Gemfile.lock
COPY Gemfile* ./

# Instala as gems
RUN bundle install

# Copia o restante do projeto
COPY . .

# Instala dependências JS
RUN yarn install --frozen-lockfile

# Define PATH global
ENV PATH="/usr/local/bin:$PATH"

# Expõe porta padrão
EXPOSE 3000

# Comando padrão
CMD ["sh", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3000"]
