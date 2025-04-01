#$KCODE='UTF-8'
require 'rubygems'
require 'irb/completion'

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:EVAL_HISTORY] = 200
IRB.conf[:AUTO_INDENT] = true
