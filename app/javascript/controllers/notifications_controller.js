import { Controller } from "@hotwired/stimulus"
// import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["badge", "list", "placeholder", "notification"]
  static values = {
    accountId: String, // Current account ID
    accountUnread: Number, // Unread count for the current account
    totalUnread: Number, // Unread count across all the user's accounts
  }

  connect() {
    if (this.hasUnread()) this.showUnreadBadge()
  }

  // Called when the notifications view opens
  open() {
    this.hideUnreadBadge()
    this.markAllAsRead()
  }

  hasUnread() {
    return !!this.accountUnreadValue
  }

  showUnreadBadge() {
    if (this.hasBadgeTarget == false) { return }
    this.badgeTarget.classList.remove("hidden")
    // mobile nav
    document.getElementById("mobile-notifications").classList.remove("hidden")
  }

  hideUnreadBadge() {
    if (this.hasBadgeTarget == false) { return }
    this.badgeTarget.classList.add("hidden")
  }

  markAllAsRead() {
    let ids = this.notificationTargets.map((target) => target.dataset.id)
    // this.subscription.perform("mark_as_read", {ids: ids})

    this.accountUnreadValue = 0
    this.totalUnreadValue -= ids.length
  }

  markAsInteracted(event) {
    let id = event.currentTarget.dataset.id
    if (id == null) return
    // this.subscription.perform("mark_as_interacted", {ids: [id]})

    // Uncomment to visually mark notification as interacted
    // event.currentTarget.dataset.interactedAt = new Date()
  }
}