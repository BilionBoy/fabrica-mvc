import { Controller } from "@hotwired/stimulus"
import Turbo from "@hotwired/turbo"

export default class extends Controller {
  static targets = ["column"]

  draggedTask = null
  sourceColumn = null

  dragStart(event) {
    this.draggedTask = event.currentTarget
    this.sourceColumn = this.draggedTask.closest("[data-column-id]")
    event.currentTarget.classList.add("opacity-50", "scale-95")
    event.dataTransfer.effectAllowed = "move"
  }

  dragOver(event) {
    event.preventDefault()
    event.dataTransfer.dropEffect = "move"
  }

  drop(event) {
    event.preventDefault()

    if (!this.draggedTask) return

    const targetColumn = event.currentTarget.closest("[data-column-id]")
    const sourceColumnId = this.sourceColumn.getAttribute("data-column-id")
    const targetColumnId = targetColumn.getAttribute("data-column-id")
    const taskId = this.draggedTask.getAttribute("data-task-id")

    if (sourceColumnId === targetColumnId) {
      this.resetDrag()
      return
    }

    // Send PATCH request to Rails backend to update task column
    fetch(`/tasks/${taskId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({
        column_id: targetColumnId,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        // Move the task element in the DOM
        targetColumn.appendChild(this.draggedTask)
        this.resetDrag()
        // Trigger Turbo to update counts if needed
        Turbo.visit(window.location.href, { action: "replace" })
      })
      .catch((error) => {
        console.error("Error updating task:", error)
        this.resetDrag()
      })
  }

  dragEnd(event) {
    this.resetDrag()
  }

  resetDrag() {
    if (this.draggedTask) {
      this.draggedTask.classList.remove("opacity-50", "scale-95")
    }
    this.draggedTask = null
    this.sourceColumn = null
  }

  showAddTaskForm(event) {
    const columnId = event.currentTarget.closest("[data-column-id]").getAttribute("data-column-id")
    // Trigger Turbo to load add task form
    Turbo.visit(`/tasks/new?column_id=${columnId}`, { frame: "add-task-form" })
  }
}
