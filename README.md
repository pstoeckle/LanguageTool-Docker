# I4 Language Tool

[[_TOC_]]

[LanguageTool](https://languagetool.org/) is a nice tool to check your text for typos and grammar errors.
One main advantage above [Grammarly](https://app.grammarly.com/) is that LanguageTool also supports German and you can set up your own server.
I did this under <https://lang.sse.cit.tum.de>.
You can find all the code necessary to set up this server in this repository.

## FAQ

> How do you spellcheck your LaTeX papers with the tool?
Do you copy them into LibreOffice and check them there?

There is a Visual Studio Code plugin <https://github.com/valentjn/vscode-ltex>.
Furthermore, there is some documentation about LanguageTool + LaTeX available at <https://dev.languagetool.org/checking-la-tex-with-languagetool>
And for Overleaf / <latex.tum.de>, you can use the Firefox / [Chrome plugin](https://chrome.google.com/webstore/detail/grammar-spell-checker-%E2%80%94-l/oldceeleldhonbafppcapldpdifcinji)

> When I click on the link <https://lang.sse.cit.tum.de/>, all I see is:

```
Error: Missing arguments for LanguageTool API. Please see https://languagetool.org/http-api/swagger-ui/#/default
```

You have to provide the text as parameters, e.g., <https://lang.sse.cit.tum.de/v2/check?language=en-US&text=Don%E2%80%99t%20forget%20to%20put%20on%20the%20breaks> … or set the URL in the Browser Plugin

## References

- <https://github.com/Erikvl87/docker-languagetool>: Cool repository with similar goal of this repository.
- <https://github.com/languagetool-org/languagetool>: The LanguageTool repository.
- <https://dev.languagetool.org/http-server>: The manual how to set up your own LanguageTool server.

## Contact

If you have any question, please contact [Patrick Stöckle](mailto:patrick.stoeckle@tum.de?subject=GitLab%3A%20I4%20LanguageTool).
