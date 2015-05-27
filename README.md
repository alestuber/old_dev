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
rake db:create db:migrate
```

### Database initialization

```
rake db:seed
```

### How to run the test suite


```
rake tests
```

You also can have [guard](https://github.com/guard/guard/) installed and run

```
guard
```

to watch the tests being run as you change the files

### How to run the security scanner


We are using [brakeman scanner](http://brakemanscanner.org/) to keep an eye on
the security issues. To run:

```
rake brakeman:run
```

TODO: we must add the security verification to our continuous integration process.

### How to run the code analysys

While we do not have a [Codeclimate](https://codeclimate.com) subscription, we
are using [rubycritic](https://github.com/whitesmith/rubycritic) and
[rubocop](https://github.com/bbatsov/rubocop).

To run rubycritic:

```
bundle exec rubycritic app lib tests
```

then visualize the generated report:

```
open tmp/rubycritic/overview.html
```

To run rubocop:

```
bundle exec rubocop -D
```

And you will see the blames on the terminal.

### Internationalization

Refer to [rails-i18n pt-BR file](https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/pt-BR.yml)
if you need to override any translation to Brazilian Portuguese.

### Active Admin

Documentation on: https://github.com/activeadmin/activeadmin/tree/master/docs#activeadmin-documentation

### To Be Documented

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
