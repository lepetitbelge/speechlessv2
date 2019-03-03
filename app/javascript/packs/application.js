import "bootstrap";

import { initThreads } from '../components/thread';
initThreads();

import { initHighlighter } from '../components/highlight';
initHighlighter();

import { navbarSticky } from '../components/navbar';
window.onscroll = function() {navbarSticky()};
