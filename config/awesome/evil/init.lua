-- Monitoring
require("evil.cpu")
require("evil.ram")
require("evil.temperature")
require("evil.battery")
require("evil.disk")

-- User controlled
require("evil.volume")
require("evil.microphone")
require("evil.mpd")
require("evil.brightness")
-- require("evil.spotify")

-- Internet access required
-- Note: These daemons use a temp file to store the retrieved values in order
-- to check its modification time and decide if it is time to update or not.
-- No need to worry that you will be updating too often when restarting AwesomeWM :)
-- This is useful because some APIs have a limit on the number of calls per hour.
require("evil.coronavirus")
require("evil.weather")
