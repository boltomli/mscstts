% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ms_synthesize.R
\name{ms_synthesize}
\alias{ms_synthesize}
\alias{ms_region}
\alias{ms_regions}
\alias{ms_set_region}
\alias{ms_synthesize_api_url}
\title{Get Microsoft Text To Speech (TTS) or Cognitive
Services Token from API Key}
\usage{
ms_synthesize(
  script,
  token = NULL,
  api_key = NULL,
  gender = c("Female", "Male"),
  language = "en-US",
  voice = NULL,
  output_format = c("raw-16khz-16bit-mono-pcm", "raw-8khz-8bit-mono-mulaw",
    "riff-8khz-8bit-mono-alaw", "riff-8khz-8bit-mono-mulaw", "riff-16khz-16bit-mono-pcm",
    "audio-16khz-128kbitrate-mono-mp3", "audio-16khz-64kbitrate-mono-mp3",
    "audio-16khz-32kbitrate-mono-mp3", "raw-24khz-16bit-mono-pcm",
    "riff-24khz-16bit-mono-pcm", "audio-24khz-160kbitrate-mono-mp3",
    "audio-24khz-96kbitrate-mono-mp3", "audio-24khz-48kbitrate-mono-mp3"),
  escape = FALSE,
  region = NULL,
  api = c("tts", "bing"),
  ...
)

ms_region(region = ms_regions())

ms_regions()

ms_set_region(region = ms_regions())

ms_synthesize_api_url(api = c("tts", "bing"), region = NULL)
}
\arguments{
\item{script}{A character vector of lines to be spoken}

\item{token}{An authentication token, base-64 encoded usually from
\code{\link{ms_get_tts_token}}.  If not provided, will be created from
\code{\link{ms_get_tts_token}}}

\item{api_key}{Microsoft Cognitive Services API key, if token is not
provided.}

\item{gender}{Sex of the Speaker}

\item{language}{Language to be spoken,
must be from \code{\link{ms_language_codes}}}

\item{voice}{full voice name, usually from
\code{\link{ms_language_to_ms_name}}.  Will override
language and gender.}

\item{output_format}{Format of the output, see
\url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech/api-reference-rest/bingvoiceoutput}
for more information}

\item{escape}{Should non-standard characters be substituted?  Should not
be used if \code{script} has SSML tags. See \code{\link{ms_create_ssml}}}

\item{region}{Subscription region for your key.
See \url{https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/rest-apis#text-to-speech}}

\item{api}{which API to authorize on, either
\code{tts} for text to speech or \code{bing} for
Bing text to speech API}

\item{...}{Additional arguments to send to \code{\link{POST}}}
}
\value{
A list of the request, content, token, and `SSML`.
}
\description{
Get Microsoft Text To Speech (TTS) or Cognitive
Services Token from API Key
}
\note{
The
content is likely in a binary format and the output depends on the
`output_format` chosen.  For example, if the `output_format` is an `MP3`,
then see below example
}
\examples{
\dontrun{
if (ms_have_tts_key()) {
res = ms_synthesize(
script = "hey, how are you doing? I'm doing pretty good",
output_format = "audio-16khz-128kbitrate-mono-mp3")
tmp <- tempfile(fileext = ".mp3")
writeBin(res$content, con = tmp)
mp3 = tuneR::readMP3(tmp)
}

}
ms_regions()
}
