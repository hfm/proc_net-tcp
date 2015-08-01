module ProcNet
  class Base
    def self.hex2ip(hex_ip)
      format('%d.%d.%d.%d',
             (hex_ip.hex >> 24) & 0xff,
             (hex_ip.hex >> 16) & 0xff,
             (hex_ip.hex >> 8)  & 0xff,
             (hex_ip.hex)       & 0xff)
    end

    def self.hex2port(hex_port)
      hex_port.to_i(16)
    end
  end
end
