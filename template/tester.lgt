:- initialization((
	set_logtalk_flag(report, warnings),
	set_logtalk_flag(lgtunit(loader)),
	logtalk_load(debugger(loader)),
	set_logtalk_flag(context_switching_calls, allow),
	logtalk_load(main, [source_data(on), debug(on)]),
	logtalk_load(tests, [hook(lgtunit), debug(on)]),
	tests::run
)).
