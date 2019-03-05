

/ form id="target"
/   input type="text" name="code" 
/   input type="submit"
/ 
/ javascript:
/   $('#target').submit(function(event) {
/     
/   });
/ 
/ 
/ 
/ doctype html
/ html
/   head
/     title Nd Chess using Amber
/     meta charset="utf-8"
/     meta http-equiv="X-UA-Compatible" content="IE=edge"
/     meta name="viewport" content="width=device-width, initial-scale=1"
/     link rel="stylesheet" href="/dist/main.bundle.css"
/     link rel="apple-touch-icon" href="/favicon.png"
/     link rel="icon" href="/favicon.png"
/     link rel="icon" type="image/x-icon" href="/favicon.ico"
/ 
/   body
/     nav.navbar.navbar-expand.navbar-dark.bg-primary
/       .container
/         a.navbar-brand href="/"
/           img src="/dist/images/logo.svg" height="30" alt="Amber logo"
/         ul.navbar-nav.mr-auto
/           == render(partial: "layouts/_nav.slang")
/ 
/     .container
/       - flash.each do |key, value|
/         div class="alert alert-#{key}" role="alert"
/           = flash[key]
/ 
/       .main== content
/ 
/     script src="/dist/main.bundle.js"
/ 
/     - if Amber.settings.auto_reload?
/       script src="/js/client_reload.js"
/ 
/ .row.justify-content-center
/   .col-sm-12.col-md-6
/     h2 = t "welcome_to_amber"
/     p Thank you for trying out the Amber Framework.  We are working hard to provide a super fast and reliable framework that provides all the productivity tools you are used to without sacrificing the speed.
/     .list-group
/       a.list-group-item.list-group-item-action target="_blank" href="https://docs.amberframework.org" Getting Started with Amber Framework
/       a.list-group-item.list-group-item-action target="_blank" href="https://github.com/veelenga/awesome-crystal" List of Awesome Crystal projects and shards
/       a.list-group-item.list-group-item-action target="_blank" href="https://crystalshards.xyz" What's hot in Crystal right now
/ 
/ - active = context.request.path == "/" ? "active" : ""
/ li.nav-item class=active
/   a.nav-link href="/" Home
/ - if (current_user = context.current_user)
/   li.nav-item
/     a.nav-item.nav-item-auth.nav-item-auth-signout href="/signout" Sign Out
/   - active = context.request.path == "/profile" ? "active" : ""
/   li.nav-item class=active
/     a.nav-link href="/profile"
/       == current_user.email
/ 
/ - else
/   - active = context.request.path == "/signup" ? "active" : ""
/   li.nav-item class=active
/     a.nav-link href="/signup" Sign Up
/   - active = context.request.path == "/signin" ? "active" : ""
/   li.nav-item class=active
/     a.nav-link href="/signin" Sign In
