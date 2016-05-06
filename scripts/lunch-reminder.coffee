module.exports = (robot) ->
  robot.hear /andrew/i, (res) ->
    res.reply 'Spare him'

  robot.hear /schedule moonshot lunch for (.*)/i, (res) ->
    time = res.match[1]
    res.reply "Okay, I'll schedule lunch for #{time}"
    robot.brain.set 'timeForLunch', time

  robot.hear /what time is lunch\?/, (res) ->
    expertName = robot.brain.get 'expertName'
    if expertName
      res.reply "We will be eating lunch during moonshot because we'll be meeting with #{expertName}, our expert in Data Analytics"
    else
      res.reply robot.brain.get 'timeForLunch'

  robot.hear /expert named (.*)/i, (res) ->
    expertName = res.match[1]
    robot.brain.set "expertName", expertName
    res.reply "Okay, this week we'll be meeting with #{expertName}"
