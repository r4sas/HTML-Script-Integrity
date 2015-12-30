# HTML-Script-Integrity
Bash script i use to generate html for javascript file integrity.

##How to use:

Run the following commands to fetch script and allow it to run:

- wget https://raw.githubusercontent.com/markcoker/HTML-Script-Integrity/master/integrity.sh
- chmod +x ./integrity.sh

The syntax ./integrity.sh url, here is an example for jquery:

- ./integrity.sh https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js

It will then output the follow HTML snippet, which you can copy directly into your project:

```html
<script src=https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js integrity=sha256-"ivk71nXhz9nsyFDoYoGf2sbjrR9ddh+XDkCcfZxjvcM= sha512-7aMbXH03HUs6zO1R+pLyekF1FTF89Deq4JpHw6zIo2vbtaXnDw+/2C03Je30WFDd6MpSwg+aLW4Di46qzu488Q=="></script>'
```
##What OS has it been tested on?

- MAC OSX 10.11.2 (non-extensive testing)

Feel free to let me know what systems it does/doesnt work on :).
