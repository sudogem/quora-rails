## Requirements
MySQL 5.7.14  
Rails 4.2.x  
Ruby 2.3.0  

## Ruby version supported/unsupported
| Supported     | Unsupported   |
| ------------- | ------------- |
| 2.3.0, 2.4.0  | 2.5.0         |

## How to setup

```
$ bundle install
$ bundle exec rake db:setup
```

For development: 
```
$ bundle exec rake db:setup
$ bundle exec rake db:migrate
```


For production: 
```
$ bundle exec rake db:setup RAILS_ENV=production
$ bundle exec rake db:migrate RAILS_ENV=production 
```

Start your application using Passenger

```
For development: $ bundle exec passenger start  
For production: $ bundle exec passenger start -e production  
```

### Compiled the Assets(css, js)

bundle exec rake assets:precompile RAILS_ENV=<environment>

```
$ bundle exec rake assets:precompile RAILS_ENV=development
```
