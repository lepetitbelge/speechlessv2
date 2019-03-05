import "bootstrap";

import { initThreads } from '../components/thread';
initThreads();

import { initHighlighter } from '../components/highlight';
initHighlighter();

import { navbarSticky } from '../components/navbar';
// window.onscroll = function() {navbarSticky()};

import { createProgressBar } from '../components/progress_bar';
createProgressBar();

import { connectHighlightContribution } from '../components/highlight_contribution_connection';
connectHighlightContribution();

import { updateCurrentContributions } from '../components/show_current_contributions';