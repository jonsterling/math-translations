module ToNumberingFilter
  extend self

  def to_numbering(clicks, section)
    label = ""
    if section == nil then
      # NOTE: we skip the first one because it's the lesson
      clicks[1..].each do |tick|
        label << case tick["clicker"]
        when "section" then ".#{tick["value"] + 1}"
        when "result" then "·#{(tick["value"] + 97).chr}"
        else ".#{tick["value"]}"
        end
      end
      label[1..]
    else
      label = "#{section}"
      clicks[1..].each do |tick|
        label << case tick["clicker"]
        when "section" then ""
        when "result" then "·#{(tick["value"] + 97).chr}"
        else ".#{tick["value"]}"
        end
      end
      label
    end
  end
end

Liquid::Template.register_filter(ToNumberingFilter)
