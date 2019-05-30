
var host = 'http://devops-release.xianwang2019.com';

module.exports = {
    titleUrl: `${host}/request/vote/title.js`, //获取投票
    resultUrl: `${host}/request/vote/result.js`,//查看投票结果
    submitUrl: `${host}/request/vote/submit.js`, //提交投票
    // redisGetUrl: `${host}/get/`,//redis get 请求
    // redisSetUrl: `${host}/set/`,//redis set 请求
    // redisDelUrl: `${host}/del/`,//redis del 请求
}