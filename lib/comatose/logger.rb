module Comatose
  class Logger < Logger

    def debug(str)
      "[**Comatose**]: #{str}"
    end

  end

end