# LifeMeetsCristina
[![Build Status](https://travis-ci.org/chayelheinsen/lifemeetscristina.svg?branch=master)](https://travis-ci.org/chayelheinsen/lifemeetscristina)

![Website screenshot](./screenshot.png)

LifeMeetsCristina is a personal blog ran by Cristina Camacho.

This project is built using Rails 5 and Vue.

## Development

### Setup

1. Get the code.

  ```sh
  $ git clone git@github.com:chayelheinsen/lifemeetscristina.git
  ```

2. Set up your environment.

  ```sh
  $ bin/setup
  ```

3. Follow the instructions in `.env` to set up environment variables.

4. Run the project!

  ```sh
  $ rails s
  ```

Note: If you want live reloading for any of the Vue portions of the app, run

```sh
$ webpack-dev-server
```

### Continuous integration

This project is [hosted on TravisCI]. Please keep
GitHub configured to protect `master` and `develop` from failing code.

[Hosted on TravisCI]: https://travis-ci.org/chayelheinsen/lifemeetscristina

### Deployment

* Production must be manually deployed using the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) or website.

### Ongoing

* Run RuboCop before committing. There's a comprehensive style guide for this project.

  ```sh
  $ rubocop
  ```
