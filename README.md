# Tic-Tac-Toe

## Run Locally

Clone the project

```bash
  git clone hhttps://github.com/Cristian-Baeza/TTT-Ruby
```

Go to the project directory

```bash
  cd TTT-Ruby
```

Install dependencies

```bash
  bundle install
```

Start application

```bash
   bin/tictactoe.rb
```

## Running Tests

From root directory

```bash
  cd TTT-Ruby
```

Run rspec on a file from spec directory

```bash
  rspec spec/*test-file*.rb
```

## Demo

![App Screenshot](https://ik.imagekit.io/0jty0e7po/TTT-Menu_WqThmNcWn02.png?updatedAt=1633631650496)

## Run From Docker

With your Docker deamon running, input the following in your CLI:

```bash
  docker run -it cbaeza8/ttt-ruby
```

## Updating Docker Image

Any PR merged into main will automatically update the remote image repo
