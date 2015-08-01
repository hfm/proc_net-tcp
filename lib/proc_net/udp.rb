require 'proc_net/base'

module ProcNet
  class Udp < ProcNet::Base
    # EXAMPLE:
    #     sl  local_address rem_address   st tx_queue rx_queue tr tm->when retrnsmt   uid  timeout inode ref pointer drops
    #      0: 00000000:0000 00000000:0000 07 00000000:00000000 00:00000000 00000000     0        0 123456789 2 yyyyyyyyyyyyyyyy 0
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
              (\d+)
          )?
          \s*
          (.*)
        $
      /xi
    end
  end
end
