package format
import (
	"fmt"
	"strconv"
)

type HumanOutput struct {
	ByteSize float64
}

type HumanSizeOutput interface {
	HumanByteSize() (h float64, s string)
}

func NewHumanSizeMessage(s float64) (humansize float64, Unit string) {
	var msg HumanSizeOutput
	msg = NewHumanOutput(s)
	humansize, Unit = msg.HumanByteSize()
	return
}

func (HumanOutput *HumanOutput) HumanByteSize() (h float64, s string) {
	const (
		kb = 1024
		mb = 1024 * kb
		gb = 1024 * mb
		tb = 1024 * gb
		pb = 1024 * tb
	)

	var humanSize float64
	var humanUnit string
	if HumanOutput.ByteSize > pb {
		humanSize = Decimal(HumanOutput.ByteSize / pb)
		humanUnit = "PiB"
	} else if HumanOutput.ByteSize > tb {
		humanSize = Decimal(HumanOutput.ByteSize / tb)
		humanUnit = "TiB"
	} else if HumanOutput.ByteSize > gb {
		humanSize = Decimal(HumanOutput.ByteSize / gb)
		humanUnit = "GiB"
	} else if HumanOutput.ByteSize > mb {
		humanSize = Decimal(HumanOutput.ByteSize / mb)
		humanUnit = "MiB"
	} else if HumanOutput.ByteSize > kb {
		humanSize = Decimal(HumanOutput.ByteSize / kb)
		humanUnit = "KiB"
	} else {
		humanSize = Decimal(HumanOutput.ByteSize)
		humanUnit = "Bit"
	}
	return humanSize, humanUnit
}

func NewHumanOutput(bytesize float64) *HumanOutput {
	return &HumanOutput{
		ByteSize: bytesize,
	}
}

func Decimal(value float64) float64 {
	value, _ = strconv.ParseFloat(fmt.Sprintf("%.2f", value), 64)
	return value
}