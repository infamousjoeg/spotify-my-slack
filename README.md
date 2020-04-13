# Spotify my Slack REDUX

Set your Slack status based on what's playing now on Spotify.

## Local Development

1. Copy `server/.env.example` to `server/.env` and fill in the placeholders. Usually you
   should only have to change the following variables after creating both a Slack and
   Spotify development app:
   - `SLACK_CLIENT_ID`
   - `SLACK_CLIENT_SECRET`
   - `SPOTIFY_CLIENT_ID`
   - `SPOTIFY_CLIENT_SECRET`
1. Make sure Docker and Docker Compose are installed (I use Docker for Mac)
1. Run migrations: `$ docker-compose run --rm server sequelize db:migrate`
1. Start the server: `$ docker-compose up`
1. The application will be accessible at [localhost:5000](http://localhost:5000)

### Installing Dependencies on Host

Since Node.js and project dependencies are automatically installed inside the Docker
container, these steps are optional. Despite this, it is useful to have dependencies
installed on your host machine for linting, reference, and management.

1. Ensure [nvm](https://github.com/nvm-sh/nvm) is installed. Run `$ nvm install`
1. Install the project dependencies on the host: `$ npm run install-deps`
   - `install-deps` is a convenience script which installs dependencies for
     `package.json`, `client/package.json`, and `server/package.json`
1. To audit dependencies, run `$ npm audit`
1. To lint the project, run `$ ./node_modules/.bin/eslint src/`
   - The linting config is specified by `.eslintrc.yml` which should be used
     automatically

### Managing the Database
[Sequelize](https://sequelize.org/) (an ORM) is used to manage database models
and migrations.
1. Sequelize CLI is available via `$ docker-compose run --rm node sequelize`
1. Options are automatically provided to the command from `.sequelizerc`
1. To create a migration, use
   `$ docker-compose run --rm node makemigration <name>`. A specific script has
   been created due to argument conflicts with `docker-compose run`
