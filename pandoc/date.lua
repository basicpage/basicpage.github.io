function Meta(m)
  if m.date == nil then
    m.date = os.date("%e %B %Y")
    return m
  end
end
