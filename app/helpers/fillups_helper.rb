module FillupsHelper

  def calculate_mpgs(fillups)
    fillups.inject() do |last_fillup, f|
      last_fillup.calculate_mpg(f) if last_fillup
      f
    end
  end

end
