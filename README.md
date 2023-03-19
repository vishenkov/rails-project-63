### Hexlet tests and linter status:
[![Actions Status](https://github.com/vishenkov/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/vishenkov/rails-project-63/actions)

### Usage
```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: "hexlet"

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Save">
# </form>
```