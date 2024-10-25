function CodeBlock(el)

  if el.classes[1] == "paper" then
    local content = string.format("{ %s }", el.text)
    local data = pandoc.json.decode(content, false)

    if not data then
      error("Failed to decode JSON:\n" .. el.text)
    end

    local div_content = {
      pandoc.Header(3, {pandoc.Link(data.title, data.url)}),
      pandoc.Para({pandoc.Str(data.authors)}, {class = "authors"}),
      pandoc.Para({pandoc.Str(data.venue .. " (" .. data.year .. ")")}, {class = "venue"}) -- It seems the class cannot be set
    }

    local div = pandoc.Div(div_content, {class = "paper"})

    return div
  end

  return el

end
