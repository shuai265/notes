1.all problems
https://leetcode.com/api/problems/all/

2.
https://leetcode.com/graphql

3.login
https://leetcode.com/account/login/


4.runcode
https://leetcode.com/playground/api/runcode
```
@运行代码API
@method: post
@request_param:
data_input: "[1, 2, 3]" #参数
lang: "cpp" #语言
typed_code: "int main() {
    cout << "My test code" << endl;
    return 0;
}" # 代码

@response: #json格式数据
interpret_id: #任务ID
test_case: #
```

5.检查运行结果
```
https://leetcode.com/submissions/detail/interpret_1569206126.2464511/check/

API: https://leetcode.com/submissions/detail/{submission_id}/check/
@method: GET
@response: #json格式数据
code_output: #代码输出结果
state: #运行状态 SUCCESS 成功,STARTED 运行中,
status_runtime: #运行时间
run_success: true 是否成功
submission_id: 任务ID
...
```

6.中文API
https://leetcode-cn.com/api/problems/all/
https://leetcode-cn.com/problems/longest-palindromic-substring