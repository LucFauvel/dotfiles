#!/bin/bash
# Location comes from $WEATHER_LAT / $WEATHER_LON, set in your local env file
# (not tracked in this repo) so exact coordinates never end up in the public dotfiles.
LAT="$WEATHER_LAT"
LON="$WEATHER_LON"
[[ -z "$LAT" || -z "$LON" ]] && exit 0

text="$(curl -s --max-time 5 "https://wttr.in/$LAT,$LON?format=1" | sed 's/ //g')"
tooltip="$(curl -s --max-time 5 "https://wttr.in/$LAT,$LON?0QT" |
    sed 's/\\/\\\\/g' |
    sed ':a;N;$!ba;s/\n/\\n/g' |
    sed 's/"/\\"/g')"

if [[ -n "$text" ]] && ! grep -qiE "unknownlocation|notavailable" <<< "$text"; then
    echo "{\"text\": \"$text\", \"tooltip\": \"<tt>$tooltip</tt>\", \"class\": \"weather\"}"
    exit 0
fi

# wttr.in is down or errored: fall back to Open-Meteo (no key, no rate limit)
OM="$(curl -s --max-time 5 "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current_weather=true&temperature_unit=celsius")"
TEMP="$(jq -r ".current_weather.temperature" <<< "$OM")"
CODE="$(jq -r ".current_weather.weathercode" <<< "$OM")"
[[ -z "$TEMP" || "$TEMP" == "null" ]] && exit 0

case "$CODE" in
    0) ICON="☀️"; DESC="Clear sky" ;;
    1) ICON="🌤️"; DESC="Mainly clear" ;;
    2) ICON="⛅"; DESC="Partly cloudy" ;;
    3) ICON="☁️"; DESC="Overcast" ;;
    45|48) ICON="🌫️"; DESC="Fog" ;;
    51|53|55) ICON="🌦️"; DESC="Drizzle" ;;
    56|57) ICON="🌦️"; DESC="Freezing drizzle" ;;
    61|63|65) ICON="🌧️"; DESC="Rain" ;;
    66|67) ICON="🌧️"; DESC="Freezing rain" ;;
    71|73|75) ICON="🌨️"; DESC="Snow fall" ;;
    77) ICON="🌨️"; DESC="Snow grains" ;;
    80|81|82) ICON="🌧️"; DESC="Rain showers" ;;
    85|86) ICON="🌨️"; DESC="Snow showers" ;;
    95) ICON="⛈️"; DESC="Thunderstorm" ;;
    96|99) ICON="⛈️"; DESC="Thunderstorm with hail" ;;
    *) ICON="🌡️"; DESC="Weather code $CODE" ;;
esac

echo "{\"text\": \"$ICON ${TEMP}°C\", \"tooltip\": \"<tt>$DESC, ${TEMP}°C\\n(fallback: open-meteo.com)</tt>\", \"class\": \"weather\"}"
