:- initialization((
	set_logtalk_flag(report, warnings),
	set_logtalk_flag(lgtunit(loader)),
	logtalk_load(main, [source_data(on)]),
	logtalk_load(tests, [hook(lgtunit)]),
	tests::run
)).
