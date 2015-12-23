# :sushi: Provisioning Sushi

ConoHa・Arch向け

## Usage

```shell-session
$ bundle install --path=vendor/bundle -jobs=4
$ bundle exec itamae ssh -u root -h <address> sushi.rb
$ ssh s083027@<address> -p 8492 'sudo reboot'
```

## Note

`s083027`の初期パスワードは空なので、初回ログイン時に設定すること
