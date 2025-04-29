local bit = require('bit')

function PrintIPV4(addr)
  local b1 = bit.band(bit.rshift(addr, 24), 0xff)
  local b2 = bit.band(bit.rshift(addr, 16), 0xff)
  local b3 = bit.band(bit.rshift(addr, 8), 0xff)
  local b4 = bit.band(addr, 0xff)
  print(string.format('%d.%d.%d.%d', b1, b2, b3, b4))

end

function WildcardMask(prefix)
  local bitMask = bit.rshift(0xffffffff, prefix)
  PrintIPV4(bitMask)

end

function NetMask(prefix)
  local rest = 32 - prefix
  local bitMask = bit.lshift(bit.rshift(0xffffffff, rest), rest)
  PrintIPV4(bitMask)

end

