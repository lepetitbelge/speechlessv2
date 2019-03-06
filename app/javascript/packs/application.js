import "bootstrap";

import { initThreads } from '../components/thread';
initThreads();

import { initHighlighter } from '../components/highlight';
initHighlighter();

import { createProgressBar } from '../components/progress_bar';
createProgressBar();

import { connectHighlightContribution } from '../components/highlight_contribution_connection';
connectHighlightContribution();

import { updateCurrentContributions } from '../components/show_current_contributions';
updateCurrentContributions();


// import { transitionToWordcloud } from '../components/home_page_banner';
// transitionToWordcloud();

