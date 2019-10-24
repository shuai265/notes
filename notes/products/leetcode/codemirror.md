1.CodeMirror API
```
初始化
    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
      lineNumbers: true,
      styleActiveLine: true,
      matchBrackets: true
    });

取值
    editor.getValue()

设置值
    editor.setValue("xxx")
```

