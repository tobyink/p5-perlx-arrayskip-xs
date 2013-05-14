use lib "blib/lib";
use lib "blib/arch";

use Benchmark ':all';
use PerlX::ArraySkip ();
use PerlX::ArraySkip::XS ();

cmpthese(5_000_000, {
	pp    => q{ PerlX::ArraySkip::arrayskip(foo => 1) },
	xs    => q{ PerlX::ArraySkip::XS::arrayskip(foo => 1) },
});