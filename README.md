# My Github Pages
[![Known Vulnerabilities](https://snyk.io/test/github/MarioCodes/mariocodes.github.io/badge.svg?targetFile=Gemfile.lock)](https://snyk.io/test/github/MarioCodes/mariocodes.github.io?targetFile=Gemfile.lock)

Static, low maintenance portfolio generated with [Jekyll](https://jekyllrb.com/).  

## Development  

### Pre-requirements
~~~ bash
sudo apt-get install ruby-full build-essential zliblg-dev
sudo gem install jekyll bundler
~~~

### Start web server
To see how the changes would look before deploying.

~~~ bash
git clone https://github.com/MarioCodes/mariocodes.github.io.git
cd mariocodes.github.io/
sudo bundle exec jekyll serve # starts a web server at port :4000
~~~

### Do changes
Just edit the `.md` files, do a push and it will be automatically updated.
