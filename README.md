# Quickbooks Demo app

This app is for testing quickbooks api.

## Development setup

Bundle gems up, migrate database, and run the server

```shell
bundle install
rails db:migrate
rails s
```

If you are using my API keys for Quickbooks, you might need to setup following
things in your /etc/hosts file

`sudo vim /etc/hosts`

Add below entry to this file and save and exit

```shell
127.0.0.1 quickbooks-demo.dev
```

> NOTE: you can setup your app from [Intuit's Developer page](https://developer.intuit.com)


## Important note about Quickbooks.

To get approved in Quickbooks appcenter we must

- use `QuickBooks` other words like `quickbooks`, `Quickbook`, `quickbook`, could get rejected.
- user `oauth2` for authentication
- Once users are connected using `Connect with QuickBooks` link they should be
automatically authenticated. Meaning they should not be asked to login again.

