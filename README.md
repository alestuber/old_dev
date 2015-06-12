## README

This is Mercado Fresh!

### Ruby version

* 2.2.2

### System dependencies

* [Bundler](https://github.com/bundler/bundler)
* PostgreSQL 9.4.1 or newer

### Configuration

Run bundle and be happy :-)

### Database creation

```
bundle exec rake db:create db:migrate
```

### Database initialization

```
bundle exec rake db:seed
```

### How to run the test suite


```
bundle exec rake test
```

### Internationalization

Refer to [rails-i18n pt-BR file](https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/pt-BR.yml)
if you need to override any translation to Brazilian Portuguese.

### Active Admin

Documentation at: https://github.com/activeadmin/activeadmin/tree/master/docs#activeadmin-documentation

### Missing foreign keys

We are using [immigrant](https://github.com/jenseng/immigrant) to help us finding missing foreign keys.

To run it (should be also installed in CI):

```
rake immigrant:check_keys
```

### To Be Documented

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
