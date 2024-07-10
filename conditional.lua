function Div(el)
    if FORMAT:match 'pdf' then
      if el.attributes['output'] == 'pdf' then
        return el
      else
        return pandoc.Null()
      end
    elseif FORMAT:match 'html' then
      if el.attributes['output'] == 'html' then
        return el
      else
        return pandoc.Null()
      end
    else
      return el
    end
  end
  