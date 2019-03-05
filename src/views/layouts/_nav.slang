- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- if (current_user = context.current_user)
  li.nav-item
    a.nav-item.nav-item-auth.nav-item-auth-signout href="/signout" Sign Out
  - active = context.request.path == "/profile" ? "active" : ""
  li.nav-item class=active
    a.nav-link href="/profile"
      == current_user.email

- else
  - active = context.request.path == "/signup" ? "active" : ""
  li.nav-item class=active
    a.nav-link href="/signup" Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  li.nav-item class=active
    a.nav-link href="/signin" Sign In
