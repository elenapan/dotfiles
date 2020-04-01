-- Monitoring
require("evil.cpu")
require("evil.ram")
require("evil.temperature")
require("evil.battery")
require("evil.disk")

-- User controlled
require("evil.volume")
require("evil.mpd")
require("evil.brightness")
-- require("evil.spotify")

-- Internet access required
-- Note: These daemons use a temp file to store the retrieved
-- values in order to check its modification time and decide if it is time to update or not.
-- If you want to change their parameters (e.g.
-- coronavirus_country), make sure to delete files
-- `/tmp/awesomewm-evil-weather` and
-- `/tmp/awesomewm-evil-coronavirus` before restarting AwesomeWM.
require("evil.coronavirus")
require("evil.weather")
