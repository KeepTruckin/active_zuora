module ActiveZuora
  class DateTimeField < Field

    def type_cast(value)
      return value if value.nil? || value.is_a?(Date)
      return value.to_datetime if value.is_a?(Time)
      value.to_datetime rescue default
    end

    def build_xml(xml, soap, value, options={})
      # All times need to be in PST time.
      # 2012-05-22T00:00:00-08:00
      value = value ? value.in_time_zone('Pacific Time (US & Canada)').iso8601 : ''
      super(xml, soap, value, options)
    end

  end
end