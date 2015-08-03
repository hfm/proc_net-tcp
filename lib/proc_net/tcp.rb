module ProcNet
  class Tcp
    # EXAMPLE:
    #     sl  local_address rem_address   st tx_queue rx_queue tr tm->when retrnsmt   uid  timeout inode
    #      0: 0100007F:05E0 00000000:0000 0A 00000000:00000000 00:00000000 00000000     0        0 4154423584 1 ffff8103f1fee6c0 3000 0 0 2 -1
    # ORIGINALED BY:
    #     http://search.cpan.org/~salva/Linux-Proc-Net-TCP/lib/Linux/Proc/Net/TCP.pm
    def self.regexp
      /
        ^\s*
          (\d+):\s
          ([\dA-F]{8}(?:[\dA-F]{24})?):([\dA-F]{4})\s
          ([\dA-F]{8}(?:[\dA-F]{24})?):([\dA-F]{4})\s
          ([\dA-F]{2})\s
          ([\dA-F]{8}):([\dA-F]{8})\s
          (\d\d):([\dA-F]{8}|F{9,}|1AD7F[\dA-F]{6})\s
          ([\dA-F]{8})\s+
          (\d+)\s+
          (\d+)\s+
          (\d+)\s+
          (\d+)\s+
          ((?:[\dA-F]{8}){1,2})
          (?:
              \s+
              (\d+)\s+
              (\d+)\s+
              (\d+)\s+
              (\d+)\s+
              (-?\d+)
          )?
          \s*
          (.*)
        $
      /xi
    end

    def self.hex2ip(hex_ip)
      format('%d.%d.%d.%d',
             (hex_ip.hex >> 24) & 0xff,
             (hex_ip.hex >> 16) & 0xff,
             (hex_ip.hex >> 8)  & 0xff,
             (hex_ip.hex)       & 0xff)
    end

    def self.hex2port(hex_port)
      raise InvalidArgument, "#{hex_port}" unless hex_port.length == 4
      hex_port.to_i(16).to_s
    end
  end
end
