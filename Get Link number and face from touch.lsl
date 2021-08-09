default
{
    touch_start(integer total_number)
    {
        llOwnerSay("Link: " + (string)llDetectedLinkNumber(0) + " Face: " + (string)llDetectedTouchFace(0));
    }
}