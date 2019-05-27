//definde
function main() {
	var a = request.getString("a") || 'mya20190527';
	var b = request.getInteger("b") || 0;

	return {
		a : a,
		b : b
	}
}

// invoke
main();