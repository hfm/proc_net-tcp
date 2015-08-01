require "proc_net/base"

module ProcNet
  class Tcp < ProcNet::Base
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
  end
end
