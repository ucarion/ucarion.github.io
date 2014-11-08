---
---

jQuery ->
  color = rgbToHex(hsvToRgb(randColor()))

  $('#post-title-container').css('background-color', color)

rgbToHex = (rgb) ->
  {r: r, g: g, b: b} = rgb

  "#" + r.toString(16) + g.toString(16) + b.toString(16)

randColor = () ->
  h = Math.random()
  s = 0.263
  v = 0.224

  {h: h, s: s, v: v}

hsvToRgb = (hsv) ->
  {h: h, s: s, v: v} = hsv

  i = Math.floor(h * 6)
  f = h * 6 - i
  p = v * (1 - s)
  q = v * (1 - f * s)
  t = v * (1 - (1 - f) * s)

  [r, g, b] = switch i % 6
    when 0
      [v, t, p]
    when 1
      [q, v, p]
    when 2
      [p, v, t]
    when 3
      [p, q, v]
    when 4
      [t, p, v]
    when 5
      [v, p, q]

  {r: Math.floor(r * 255), g: Math.floor(g * 255), b: Math.floor(b * 255)}

