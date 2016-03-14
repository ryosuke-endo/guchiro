module AnonymousHelper
  class Anonymous
    class << self
      def name(user_ip)
        day = Date.today.to_s
        @anonymous_name = user_ip + day
      end

      def digest(name, character_length)
        @anonymous_digest = Digest::SHA512.hexdigest(name).slice(0..character_length)
      end
    end
  end
end
