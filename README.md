vim-markdown
============

Simple markdown extension for Vim.

## Features:

* Recognizes .md files as markdown
* Highlight basic Markdowns: headings, list, URL...
* Detects string between $...$ as LaTex
* Syntax highlight for code snippet between triple `` ` ``:
    * Currently allows: C++ (cpp or c++), Java (java), Python (py or python), Ruby (ruby)
    * Example code between: \`\`\`cpp ... \`\`\` will be highlighted as C++ codes

## Install:

Using Vundle: just add the following line:

```
Bundle 'ngthanhtrung23/vim-markdown'
```

and run _:PluginInstall_
