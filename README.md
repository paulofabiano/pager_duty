# Pager Duty Code Challange

This is a an simple ruby client gem along with an CLI executable for fetching data from Pager Duty API.

## Install the gem

Use the `rake install` command. This will trigger the build of the gem and install it.

## Run the executable

Call in your terminal the `pager_duty` command along with the methood you want to call (list_users is the only on available). Make sure you pass the token api with the -t paramenter:

```shell
pager_duty list_users -t 'y_NbAkKc66ryYTWUXYEu'
```

You can customize the pagination by passing the limit and offset values using the -l and -o parameters:

```shell
pager_duty list_users -t 'y_NbAkKc66ryYTWUXYEu' -l 2 -o 2
```

Last but not least, you can pretify the JSON output by using the -p parameter, like this:

```shell
pager_duty list_users -t 'y_NbAkKc66ryYTWUXYEu' -l 2 -o 2 -p true
```

## Uninstall it

Just run `rake uninstall` and the gem will be removed from your system, as long as the executable from your terminal.

