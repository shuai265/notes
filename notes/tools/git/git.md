
1. cherry-pick
```
# 将指定提交合并到 working tree，用于合并分支上的部分提交
git cherry-pick <commit>

#多个commit 
git cherry-pick <commit1>..<commit100>
```


2. checkout 
```
1.切换分支
git checkout branch

2. 回退部分文件到指定的提交
git checkout [commit_id] [file_name]
```


3. branch
```
git branch -r #查看远端
git branch -a #查看所有
git checkout -b newBrach
```

4. tag


5. merge


6. pull
```
git pull --rebase
```

7. log
```
1. 查看日志
git log --oneline -3

2. 查找指定字符串的所有修改记录
git log -p -Sxxx
xxxx: target string

Git can search diffs with the -S option (it's called pickaxe in the docs https://git-scm.com/docs/git-log#git-log--Sltstringgt)

git log -Spassword
This will find any commit that added or removed the string password. Here a few options:

-p: will show the diffs. If you provide a file (-p file), it will generate a patch for you.
-G: looks for differences whose added or removed line matches the given regexp, as opposed to -S, which "looks for differences that introduce or remove an instance of string".
--all: searches over all branches and tags; alternatively, use --branches[=<pattern>] or --tags[=<pattern>]

```

8. commit 
```

```

9. diff


10. git bisect
# 二分法定位问题提交


11. git log 
```


```


12. pull


13. stash


14. reset
```
1. 重置文件
git reset --hard

```

15. restore

16. revert



