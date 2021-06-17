get '/userAwardCard/list' do

{
  "result": {
    "errno": "OK",
    "errmsg": "成功"
  },
  "data": {
    "details": [
      {
        "id": 123,
        "awardName": "回归奖励UFO22",
        "createTime": "1622112198",
        "award":    [{
            "awardType": "AwardSecond",
            "awardValue": 9900
          }]
      },
      {
        "id": 1231,
        "awardName": "回归奖励OK",
        "createTime": "1622112198",
        "award":    [{
            "awardType": "AwardSecond",
            "awardValue": 9900
          }]
      },
      {
        "id": 1232,
        "awardName": "回归奖励",
        "createTime": "1622112198",
        "award":    [{
            "awardType": "AwardSecond",
            "awardValue": 9900
          }]
      }
    ]
  }
}
  
end