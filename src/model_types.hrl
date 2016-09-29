-ifndef(_model_types_included).
-define(_model_types_included, yeah).

%% struct 'Complex'

-record('Complex', {'r' :: integer(),
                    'i' :: integer()}).
-type 'Complex'() :: #'Complex'{}.

%% struct 'Status'

-record('Status', {'success' :: boolean(),
                   'desc' :: string() | binary()}).
-type 'Status'() :: #'Status'{}.

%% struct 'Result'

-record('Result', {'status' :: 'Status'(),
                   'result' :: 'Complex'()}).
-type 'Result'() :: #'Result'{}.

-endif.
