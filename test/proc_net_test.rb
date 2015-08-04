require 'test_helper'

class TestProcNetBase < Test::Unit::TestCase
  def setup
    @tcp = ProcNet::Tcp.new
  end
  def test_hex_to_ip
    assert_equal '98.138.253.109', ProcNet::Tcp.hex2ip('628AFD6D')
  end

  def test_hex_to_port
    assert_equal "22", ProcNet::Tcp.hex2port('0016')
  end

  def test_read
    table = @tcp.read('sample_tcp.txt') # => Array
    assert_equal 4, table.size
  end
end
